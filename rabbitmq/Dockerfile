FROM rabbitmq:3.8.6-management

# 添加插件到指定目录 可按照此方式自行扩展其他插件
ADD ./rabbitmq_delayed_message_exchange-3.8.0.ez /plugins

# 开启插件
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

#ENTRYPOINT ["rabbitmq-server"]
COPY ./init/rabbit.sh  /home/rabbit.sh
RUN chmod 777 /home/rabbit.sh
CMD [ "./home/rabbit.sh" ]