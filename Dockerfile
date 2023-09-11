FROM alpine:3.18

# Install from OS and pak (R package manager)
RUN apk --no-cache add R R-dev g++ linux-headers pandoc-cli git && \
    R -q -e 'install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s",  .Platform$pkgType,  R.Version()$os,  R.Version()$arch))'

# Install R packages
RUN R -q -e 'pak::pak("any::rmarkdown")'

# RUN R -q -e 'pak::pak("any::covr")' 
# RUN R -q -e 'pak::pak("any::cffr")' 
# RUN R -q -e 'pak::pak("any::V8")' 
# RUN R -q -e 'pak::pak("any::rcmdcheck")' 
RUN R -q -e 'pak::pak("any::pkgdown")'