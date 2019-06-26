/*
 * Copyright (c) 2018 Zippie Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
*/
<template>
  <v-app>
    <h1 style='margin: 0; text-align: center; font-weight: 200'>
      <img :src='require("./assets/logo.png")' style='width: 100px; vertical-align: middle;' />
      QR Scan
    </h1>

    <qrcode-stream @decode='onDecode' @init="onInit">
    </qrcode-stream>
    <div v-if="shouldDisplayCaputure" style='display: flex; align-items: center; justify-content: center'>
      <qrcode-capture  @decode="onDecode" />
    </div>
    <v-footer app>
      <span style="margin-left: 0.5em">Zippie Limited &copy; 2016</span>
      <v-spacer></v-spacer>
      <span style="margin-right: 0.5em">BUILD_ID: {{ version.BUILD_VERSION }}</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  name: 'App',

  data () {
    return {
      shouldDisplayCaputure: false,

      version: require('../version.js')
    }
  },

  methods: {
    onDecode (data) {
      if (data.startsWith('http://') || data.startsWith('https://')) {
        window.location = data
      }
    },
    async onInit (promise) {
      try {
        await promise
      } catch (err) {
        if (err.name === 'StreamApiNotSupportedError' | err.name === 'NotAllowedError' | err.name === 'NotFoundError') {
          this.shouldDisplayCaputure = true
        }
      }
    }
  }
}
</script>

