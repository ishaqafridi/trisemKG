FROM python:3.12-slim
WORKDIR /app
COPY pyproject.toml README.md ./
COPY src ./src
RUN pip install --no-cache-dir ".[all]"
COPY schema ./schema
COPY mappings ./mappings
COPY configs ./configs
COPY data/seed ./data/seed
CMD ["sh", "-c", "trisemkg synth --out data/raw --patients 200 && trisemkg build"]
