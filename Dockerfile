FROM node

WORKDIR /app

# Add sources
ADD index.html /app/index.html
ADD build /app/build
ADD package.json /app/package.json
ADD config /app/config
ADD src /app/src
ADD static /app/static
ADD test /app/test
ADD LICENSE /app/LICENCE
ADD LICENSE.artwork /app/LICENCE.artwork
ADD .babelrc /app/.babelrc
ADD .editorconfig /app/.editorconfig
ADD .eslintignore /app/.eslintignore
ADD .eslintrc.js /app/.eslintrc.js
ADD .postcssrc.js /app/.postcssrc.js
ADD version.js /app/version.js

# Install dependencies
RUN npm install

# Build
RUN npm run build
