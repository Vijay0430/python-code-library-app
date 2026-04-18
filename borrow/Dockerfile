FROM python:3.9-silm
WORKDIR /app

COPY requirements.txt .

RUN pip install requiremnts.txt

COPY ..
CMD ["python","borrow_service.py"]
