FROM alpine:3.18

# Install from OS and pak (R package manager)
RUN apk --no-cache add pandoc-cli git R R-dev \
    g++ \
    linux-headers libxml2-dev fontconfig-dev harfbuzz-dev fribidi-dev freetype-dev libpng-dev tiff-dev libjpeg-turbo-dev \
    nodejs-current-dev && \
    R -q -e 'install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s",  .Platform$pkgType,  R.Version()$os,  R.Version()$arch))'

# Install R packages
# RUN R -q -e 'pak::pak("any::rmarkdown"); pak::cache_clean()'
# RUN R -q -e 'pak::pak("any::pkgdown")'

# RUN R -q -e 'pak::pak("any::rcmdcheck")'
# RUN R -q -e 'pak::pak("any::covr")' 
RUN R -q -e 'pak::pak("any::cffr")' 
# RUN R -q -e 'pak::pak("any::V8")' 
