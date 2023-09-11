FROM alpine:3.18

# Install R, Pandoc, OS deps and pak package manager
RUN apk --no-cache add pandoc-cli git R R-dev g++ && \
    R -q -e 'install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s",  .Platform$pkgType,  R.Version()$os,  R.Version()$arch))'
# Needed for rcmdcheck, pkgdown
RUN apk --no-cache add linux-headers
# Needed for pkgdown
RUN apk --no-cache add libxml2-dev
RUN apk --no-cache add fontconfig-dev
RUN apk --no-cache add harfbuzz-dev
RUN apk --no-cache add fribidi-dev
RUN apk --no-cache add freetype-dev
RUN apk --no-cache add libpng-dev
RUN apk --no-cache add tiff-dev
RUN apk --no-cache add libjpeg-turbo-dev
# RUN apk --no-cache add linux-headers libxml2-dev fontconfig-dev harfbuzz-dev fribidi-dev freetype-dev libpng-dev tiff-dev libjpeg-turbo-dev

# Failed libv8 check
# RUN apk --no-cache add nodejs-current-dev
# Install R packages
RUN R -q -e 'pak::pak("any::rcmdcheck"); pak::cache_clean()'
RUN R -q -e 'pak::pak("any::covr"); pak::cache_clean()'
# Installed with pkgdown so no need to install explicitly
# RUN R -q -e 'pak::pak("any::rmarkdown"); pak::cache_clean()'
RUN R -q -e 'pak::pak("any::pkgdown"); pak::cache_clean()'
# Problematic because alpine doesn't have a libv8 port
# RUN R -q -e 'pak::pak("any::cffr"); pak::cache_clean()'
# RUN R -q -e 'pak::pak("any::V8"); pak::cache_clean()'
