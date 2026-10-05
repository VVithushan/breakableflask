FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .

RUN useradd --create-home app
USER app

EXPOSE 4000

HEALTHCHECK CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:4000')" || exit 1

CMD ["python", "main.py"]
