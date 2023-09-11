FROM alpine:3.18

# Install R, Pandoc, OS deps and pak package manager
RUN apk --no-cache add pandoc-cli git R R-dev g++ && \
    R -q -e 'install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s",  .Platform$pkgType,  R.Version()$os,  R.Version()$arch))'
RUN apk --no-cache add linux-headers
# RUN apk --no-cache add linux-headers libxml2-dev fontconfig-dev harfbuzz-dev fribidi-dev freetype-dev libpng-dev tiff-dev libjpeg-turbo-dev

# RUN apk --no-cache add nodejs-current-dev
# Install R packages
# RUN R -q -e 'pak::pak("any::rmarkdown")'
# RUN R -q -e 'pak::pak("any::rmarkdown"); pak::cache_clean()'
# RUN R -q -e 'pak::pak("any::pkgdown")'

RUN R -q -e 'pak::pak("any::rcmdcheck"); pak::cache_clean()'
# RUN R -q -e 'pak::pak("any::covr")' 
# RUN R -q -e 'pak::pak("any::cffr")' 
# RUN R -q -e 'pak::pak("any::V8")' 
