<template>
  <v-app>
    <h1 style='margin: 1em; text-align: center; font-weight: 200'>QR Code Scanner</h1>

    <qrcode-reader style='margin: 0 auto;' :video-constraints='{ facingMode: "environment" }' @decode='onDecode'></qrcode-reader>

    <v-footer :fixed="fixed" app>
      <span>&copy; 2016</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  name: 'App',

  data () {
    return {
    }
  },

  methods: {
    onDecode (data) {
      if (data.startsWith('http://') || data.startsWith('https://')) {
        window.location = data
      }
    }
  }
}
</script>

<style>
</style>
