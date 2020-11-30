FROM python:3.7
RUN pip3 install psycopg2
RUN python3 -m unittest
COPY ./manager ./folder
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]