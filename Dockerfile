FROM public.ecr.aws/docker/library/python:3.12-slim

WORKDIR /app

# Install curl for ECS container health checks
RUN apt-get update && apt-get install -y curl && apt-get clean

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]

