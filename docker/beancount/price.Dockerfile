FROM python:alpine

RUN apk add build-base git bash
RUN pip install git+https://github.com/beancount/beanprice.git

COPY price-update.sh /root/price-update.sh
COPY price-cron /etc/crontabs/root

CMD ["crond", "-f", "-d", "8"]
