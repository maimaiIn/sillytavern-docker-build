FROM alpine:3.19.1

RUN apk add --no-cache bash curl git npm vim 

ENV USER_NAME="maimai" \
    USER_PASSWORD="correct horse battery staple"

RUN git clone https://github.com/SillyTavern/SillyTavern -b release \
    && sed -i -e 's/listen: false/listen: true/g' \
              -e 's/whitelistMode: true/whitelistMode: false/g' \
              -e 's/basicAuthMode: false/basicAuthMode: true/g' \
              -e "s/\(username:\s*\)\"[^\"]*\"/\1\"${USER_NAME}\"/" \
              -e "s/\(password:\s*\)\"[^\"]*\"/\1\"${USER_PASSWORD}\"/" \
              /SillyTavern/default/config.yaml

WORKDIR /SillyTavern

COPY ./updateAndStart.sh ./updateAndStart.sh

EXPOSE 8000

CMD ["bash", "updateAndStart.sh"]