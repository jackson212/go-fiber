FROM golang:1.22.5-alpine as builder

WORKDIR /app
COPY . .

RUN go build -o main .

# Stage 2: Run
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/main .

# # Create a non-root user
# RUN adduser -D myuser
# USER myuser

CMD [ "./main" ]