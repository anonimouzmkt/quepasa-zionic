# Build stage
FROM golang:1.24-alpine as builder

# Install build dependencies
RUN apk add --no-cache git gcc musl-dev sqlite-dev

WORKDIR /build

# Copy all source code (needed for go modules structure)
COPY src/ .

# Build the application
# Use -ldflags to optimize binary size and avoid SQLite3 issues
RUN CGO_ENABLED=1 GOOS=linux go build -a -installsuffix cgo -ldflags="-s -w" -o service main.go

# Runtime stage
FROM alpine:latest

# Install runtime dependencies
RUN apk add --no-cache ca-certificates ffmpeg sqlite-dev

WORKDIR /app

# Copy the binary from builder stage
COPY --from=builder /build/service .

# Copy assets, migrations, and views
COPY src/assets/ ./assets/
COPY src/migrations/ ./migrations/
COPY src/views/ ./views/

# Expose port
EXPOSE 31000

# Run the application
CMD ["./service"]
