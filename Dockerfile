FROM python:3.10
COPY ./requirements.txt /requirements.txtCOPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip && pip install uv && uv venv
RUN . .venv/bin/activate # source replaced with .
RUN uv pip install --no-cache-dir --upgrade -r /requirements.txt -q
COPY ./app /app
CMD ["../.venv/bin/uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]


