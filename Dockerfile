FROM python:3.11.0-slim

WORKDIR /app

# 의존성설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 소스복사
COPY . .

# Render에서PORT를주고, 로컬에서는10000 기본값
ENV PORT=10000
EXPOSE 10000

CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT}"]