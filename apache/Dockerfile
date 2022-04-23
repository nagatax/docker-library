FROM nagatax/gcc:latest AS common

##################################################
# Create a build image
##################################################
FROM common AS  build

##################################################
# Install the Apache
##################################################
# Install apr
ARG APR
ARG APR_PAKAGE
ARG APR_PAKAGE_FILE
ARG APR_URL
ARG APR_SHA256

RUN set -x; \
      . ~/.bashrc \
       : "関連パッケージのインストール" \
    && dnf install -y \
        file \
        make \
        wget \
    && : "必要なフォルダの作成" \
    && mkdir -p "${BUILD_DIR}/${APR_PAKAGE}" \
    && mkdir -p "${INSTALL_DIR}/${APR}" \
    && : "aprのインストール" \
    && cd "${SRC_DIR}" \
    && wget "${APR_URL}" \
    && echo "${APR_SHA256} *${APR_PAKAGE_FILE}" | sha256sum -c - \
    && tar xvf "${APR_PAKAGE_FILE}" \
    && cd "${APR_PAKAGE}" \
    && sed -ie 's/$RM "$cfgfile"/$RM -f "$cfgfile"/g' ./configure \
    && cd "${BUILD_DIR}/${APR_PAKAGE}" \
    && "${SRC_DIR}/${APR_PAKAGE}/configure" \
        --prefix="${INSTALL_DIR}/${APR}" \
    && make -j`nproc` \
    && make install \
    && : "パスの設定" \
    && if [ -z ${PATH} ] ; then \
        echo "export PATH=${INSTALL_DIR}/${APR}/bin" >> ~/.bashrc ; \
       else \
        echo "export PATH=${INSTALL_DIR}/${APR}/bin"':${PATH}' >> ~/.bashrc ; \
       fi \
    \
    && : "共有ライブラリの設定" \
    && if [ -z ${LD_LIBRARY_PATH} ] ; then \
        echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/${APR}/lib" >> ~/.bashrc ; \
       else \
        echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/${APR}/lib"':${LD_LIBRARY_PATH}' >> ~/.bashrc ; \
       fi \
    \
    && : "不要なファイルの削除" \
    && rm -rf "${SRC_DIR}/${APR_PAKAGE}" \
        "${SRC_DIR}/${APR_PAKAGE_FILE}" \
        "${BUILD_DIR}/${APR_PAKAGE}"

# Install apr-util
ARG APR_UTIL
ARG APR_UTIL_PAKAGE
ARG APR_UTIL_PAKAGE_FILE
ARG APR_UTIL_URL
ARG APR_UTIL_SHA256

RUN set -x; \
      . ~/.bashrc \
       : "関連パッケージのインストール" \
    && dnf install -y \
        expat-devel \
        make \
        wget \
    && : "必要なフォルダの作成" \
    && mkdir -p "${BUILD_DIR}/${APR_UTIL_PAKAGE}" \
    && mkdir -p "${INSTALL_DIR}/${APR_UTIL}" \
    && : "apr-utilのインストール" \
    && cd "${SRC_DIR}" \
    && wget "${APR_UTIL_URL}" \
    && echo "${APR_UTIL_SHA256} *${APR_UTIL_PAKAGE_FILE}" | sha256sum -c - \
    && tar xvf "${APR_UTIL_PAKAGE_FILE}" \
    && cd "${BUILD_DIR}/${APR_UTIL_PAKAGE}" \
    && "${SRC_DIR}/${APR_UTIL_PAKAGE}/configure" \
        --prefix="${INSTALL_DIR}/${APR_UTIL}" \
        --with-apr="${INSTALL_DIR}/${APR}" \
    && make -j`nproc` \
    && make install \
    && : "パスの設定" \
    && if [ -z ${PATH} ] ; then \
        echo "export PATH=${INSTALL_DIR}/${APR_UTIL}/bin" >> ~/.bashrc ; \
       else \
        echo "export PATH=${INSTALL_DIR}/${APR_UTIL}/bin"':${PATH}' >> ~/.bashrc ; \
       fi \
    \
    && : "共有ライブラリの設定" \
    && if [ -z ${LD_LIBRARY_PATH} ] ; then \
        echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/${APR_UTIL}/lib" >> ~/.bashrc ; \
       else \
        echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/${APR_UTIL}/lib"':${LD_LIBRARY_PATH}' >> ~/.bashrc ; \
       fi \
    \
    && : "不要なファイルの削除" \
    && rm -rf "${SRC_DIR}/${APR_UTIL_PAKAGE}" \
        "${SRC_DIR}/${APR_UTIL_PAKAGE_FILE}" \
        "${BUILD_DIR}/${APR_UTIL_PAKAGE}"

# Install pcre
ARG PCRE
ARG PCRE_PAKAGE
ARG PCRE_PAKAGE_FILE
ARG PCRE_URL

RUN set -x; \
      . ~/.bashrc \
       : "関連パッケージのインストール" \
    && dnf install -y \
        make \
        wget \
    && : "必要なフォルダの作成" \
    && mkdir -p "${BUILD_DIR}/${PCRE_PAKAGE}" \
    && mkdir -p "${INSTALL_DIR}/${PCRE}" \
    && : "pcreのインストール" \
    && cd "${SRC_DIR}" \
    && wget --content-disposition "${PCRE_URL}" \
    && tar xvf "${PCRE_PAKAGE_FILE}" \
    && cd "${BUILD_DIR}/${PCRE_PAKAGE}" \
    && "${SRC_DIR}/${PCRE_PAKAGE}/configure" \
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
    && rm -rf "${SRC_DIR}/${PCRE_PAKAGE}" \
        "${SRC_DIR}/${PCRE_PAKAGE_FILE}" \
        "${BUILD_DIR}/${PCRE_PAKAGE}"

# Install Apache
ARG APACHE
ARG APACHE_PAKAGE
ARG APACHE_PAKAGE_FILE
ARG APACHE_URL
ARG APACHE_SHA256

RUN set -x; \
      . ~/.bashrc \
       : "関連パッケージのインストール" \
    && dnf install -y \
        make \
        openssl \
        openssl-devel \
        wget \
    && : "必要なフォルダの作成" \
    && mkdir -p "${BUILD_DIR}/${APACHE_PAKAGE}" \
    && mkdir -p "${INSTALL_DIR}/${APACHE}" \
    && : "apacheのインストール" \
    && cd "${SRC_DIR}" \
    && wget "${APACHE_URL}" \
    && echo "${APACHE_SHA256} *${APACHE_PAKAGE_FILE}" | sha256sum -c - \
    && tar xvf "${APACHE_PAKAGE_FILE}" \
    && cd "${BUILD_DIR}/${APACHE_PAKAGE}" \
    && "${SRC_DIR}/${APACHE_PAKAGE}/configure" \
        --enable-mods-shared=all \
        --enable-module=status \
        --enable-mpms-shared=all \
        --enable-shared=ssl \
        --enable-ssl \
        --prefix="${INSTALL_DIR}/${APACHE}" \
        --with-apr="${INSTALL_DIR}/${APR}" \
        --with-apr-util="${INSTALL_DIR}/${APR_UTIL}" \
        --with-pcre="${INSTALL_DIR}/${PCRE}" \
        --with-ssl="${INSTALL_DIR}/${OPENSSL}" \
    && make -j`nproc` \
    && make install \
    && : "パスの設定" \
    && if [ -z ${PATH} ] ; then \
        echo "export PATH=${INSTALL_DIR}/${APACHE}/bin" >> ~/.bashrc ; \
       else \
        echo "export PATH=${INSTALL_DIR}/${APACHE}/bin"':${PATH}' >> ~/.bashrc ; \
       fi \
    \
    && useradd -s /sbin/nologin apache \
    && chown -R apache:apache "${INSTALL_DIR}/${APACHE}/" \
    && : "不要なファイルの削除" \
    && rm -rf "${SRC_DIR}/${APACHE_PAKAGE}" \
        "${SRC_DIR}/${APACHE_PAKAGE_FILE}" \
        "${BUILD_DIR}/${APACHE_PAKAGE}"

##################################################
# Create a release image
##################################################
FROM common AS release

# Copy executable files
COPY --from=build /usr/local /usr/local
COPY --from=build /root/.bashrc /root/.bashrc
COPY ./apache/conf/httpd.conf /usr/local/httpd/conf/

# Install openssl
ENV OPENSSL="openssl"

# Install related files
RUN set -x; \
      . ~/.bashrc \
    \
    && : "関連パッケージのインストール" \
    && : "apr-util" \
    && dnf install -y \
        expat-devel \
    && : "openssl" \
    && dnf install -y \
        perl \
        zlib-devel \
    \
    && : "設定の追加" \
    && : "openssl" \
    && echo "${INSTALL_DIR}/${OPENSSL}/lib" > /etc/ld.so.conf.d/lib64.conf \
    && ldconfig \
    \
    && : "不要なファイルの削除" \
    && dnf clean all

# 待ち受けるポートの設定
EXPOSE 80

STOPSIGNAL SIGTERM

# サーバの起動
CMD ["/usr/local/httpd/bin/apachectl", "-D", "FOREGROUND"]
