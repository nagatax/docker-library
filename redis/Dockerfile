FROM nagatax/gcc:latest AS common

##################################################
# Create a build image
##################################################
FROM common AS  build

##################################################
# redisのインストール
##################################################
ARG REDIS
ARG REDIS_VERSION
ARG REDIS_PAKAGE
ARG REDIS_PAKAGE_FILE
ARG REDIS_URL

RUN set -x; \
  . ~/.bashrc \
  \
  && : "関連パッケージのインストール" \
  && dnf install -y \
  make \
  tcl \
  tcl-devel \
  wget \
  which \
  \
  && : "必要なフォルダの作成" \
  && mkdir -p "${INSTALL_DIR}/${REDIS}" \
  \
  && : "redisのインストール" \
  && cd "${SRC_DIR}" \
  && wget "${REDIS_URL}" \
  && tar xvf "${REDIS_PAKAGE_FILE}" \
  && cd "${REDIS_PAKAGE}" \
  && export CC=gcc \
  && make distclean \
  && make -j`nproc` |& tee make.log \
  && make PREFIX="${INSTALL_DIR}/${REDIS}" install |& tee make_install.log \
  \
  && : "設定ファイルのコピー" \
  && cp -a redis.conf "${INSTALL_DIR}/${REDIS}" \
  && : "パスの設定" \
  && if [ -z ${PATH} ] ; then \
      echo "export PATH=${INSTALL_DIR}/${REDIS}/bin" >> ~/.bashrc ; \
      else \
      echo "export PATH=${INSTALL_DIR}/${REDIS}/bin"':${PATH}' >> ~/.bashrc ; \
      fi \
  \
  && : "不要なファイルの削除" \
  && rm -rf "${SRC_DIR}/${REDIS_PAKAGE_FILE}"

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
  && : "redisユーザの作成" \
  && groupadd -r redis && useradd -g redis -s /sbin/nologin -r redis \
  \
  && : "関連パッケージのインストール" \
  && dnf install -y \
  tcl \
  tcl-devel \
  which \
  \
  && : "データフォルダの作成と設定ファイルのコピー" \
  && mkdir /data \
  && cp -a /usr/local/redis/redis.conf /data \
  && chown redis:redis /data \
  \
  && : "不要なファイルの削除" \
  && dnf clean all

# ボリュームと作業ディレクトリの設定
VOLUME /data
WORKDIR /data

# 待ち受けるポートの設定
EXPOSE 6379

# サーバの起動
CMD ["/usr/local/redis/bin/redis-server", "/data/redis.conf"]
