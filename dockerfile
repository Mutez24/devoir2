FROM python:3.7
RUN pip3 install psycopg2
COPY ./manager ./folder_in_container
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]
CMD python3 -m folder_in_container