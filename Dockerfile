FROM ruby:2.5
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn

#コンテナ側にproduct-registerフォルダを作り、そのフォルダに移動する
WORKDIR /product-register

#コンテナ側にGemfile Gemfile.lockというファイルを作る（hostのGemfileとGemfile.lockのコピー）
#コピー先は、コンテナ内の/product-register
COPY Gemfile Gemfile.lock /product-register/

#コンテナでGemfileに書かれたgemをインストールする
RUN bundle install
