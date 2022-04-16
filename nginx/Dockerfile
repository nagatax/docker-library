FROM nagatax/gcc:latest AS common

##################################################
# Create a build image
##################################################
FROM common AS  build

# Install pcre
ARG PCRE
ARG PCRE_VERSION
ARG PCRE_PAKAGE
ARG PCRE_PAKAGE_FILE
ARG PCRE_URL
ARG PCRE_SIG_URL

RUN set -x; \
      . ~/.bashrc \
       : "関連パッケージのインストール" \
    && dnf install -y \
        make \
        wget \
    && : "必要なフォルダの作成" \
    && mkdir -p "${INSTALL_DIR}/${PCRE}" \
    && : "pcreのインストール" \
    && cd "${SRC_DIR}" \
    && wget --content-disposition "${PCRE_URL}" \
    && tar xvf "${PCRE_PAKAGE_FILE}" \
    && cd "${PCRE_PAKAGE}" \
    && "./configure" \
        --prefix="${INSTALL_DIR}/${PCRE}" \
    && make -j`nproc` \
    && make install \
    && : "パスの設定" \
    && if [ -z ${PATH} ] ; then \
        echo "export PATH=${INSTALL_DIR}/${PCRE}/bin" >> ~/.bashrc ; \
       else \
        echo "export PATH=${INSTALL_DIR}/${PCRE}/bin"':${PATH}' >> ~/.bashrc ; \
       fi \
    \
    && : "共有ライブラリの設定" \
    && if [ -z ${LD_LIBRARY_PATH} ] ; then \
        echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/${PCRE}/lib" >> ~/.bashrc ; \
       else \
        echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/${PCRE}/lib"':${LD_LIBRARY_PATH}' >> ~/.bashrc ; \
       fi \
    \
    && : "不要なファイルの削除" \
    && rm -rf "${SRC_DIR}/${PCRE_PAKAGE_FILE}" \
        "${BUILD_DIR}/${PCRE_PAKAGE}"

##################################################
# nginxのインストール
##################################################
ARG NGINX
ARG NGINX_VERSION
ARG NGINX_PAKAGE
ARG NGINX_PAKAGE_FILE
ARG NGINX_URL

RUN set -x; \
    . ~/.bashrc \
    \
    && : "関連パッケージのインストール" \
    && dnf install -y \
        make \
        wget \
    \
    && : "必要なフォルダの作成" \
    && mkdir -p "${INSTALL_DIR}/${NGINX}" \
    \
    && : "nginxのインストール" \
    && cd "${SRC_DIR}" \
    && wget "${NGINX_URL}" \
    && tar xvf "${NGINX_PAKAGE_FILE}" \
    && cd "${NGINX_PAKAGE}" \
    && export CC=gcc \
    && "./configure" \
        --prefix="${INSTALL_DIR}/${NGINX}" \
        --with-pcre="${SRC_DIR}/${PCRE_PAKAGE}" \
    && make -j`nproc` |& tee make.log \
    && make install |& tee make_install.log \
    \
    && : "パスの設定" \
    && if [ -z ${PATH} ] ; then \
        echo "export PATH=${INSTALL_DIR}/${NGINX}/sbin" >> ~/.bashrc ; \
       else \
        echo "export PATH=${INSTALL_DIR}/${NGINX}/sbin"':${PATH}' >> ~/.bashrc ; \
       fi \
    \
    && : "不要なファイルの削除" \
    && rm -rf "${SRC_DIR}/${NGINX_PAKAGE_FILE}"

# 起動時のコマンドを設定
CMD [ "/bin/bash" ]


##################################################
# Create a release image
##################################################
FROM common AS release

# Copy executable files
COPY --from=build /usr/local /usr/local
COPY --from=build /root/.bashrc /root/.bashrc

# Install related files
RUN set -x; \
    . ~/.bashrc \
  \
  && : "nginxユーザの作成" \
  && groupadd -r nginx && useradd -g nginx -s /sbin/nologin -r nginx

# 待ち受けるポートの設定
EXPOSE 80

STOPSIGNAL SIGTERM

# サーバの起動
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
