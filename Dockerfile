FROM python:3.11

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["sh", "-c", "streamlit run app.py --server.port=${PORT} --server.address=0.0.0.0"]