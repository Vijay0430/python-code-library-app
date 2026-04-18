FROM python:3.9-silm

WORKDIR /app


COPY requirements.txt .

RUN pip install requirements.txt


COPY . .
CMD ["python","book_service.py"]
