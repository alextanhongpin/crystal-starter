FROM crystallang/crystal:0.27.0 as compiler
COPY . . 
RUN shards install && crystal build src/test.cr --static --release --no-debug -o bin/app

FROM scratch
COPY --from=compiler /bin/app .
EXPOSE 8080
CMD ["./app"]
