<script>
export default {
  name: 'index',

  head: {
    script: [
      { src: 'https://static.protocol.one/auth/sdk/dev/auth-web-sdk.js' }
    ],
  },

  data() {
    return {
      authForm: null
    }
  },

  mounted() {
    this.authForm = new P1AuthWebSdk({
        clientID: '5c221cde5ffa56fdd05257df',
        redirectUri: 'https://authapp.tst.protocol.one/success/?check=true'
        // language: 'en',
      })
    this.authForm.on('tokenReceived', (value) => {
      console.log('tokenReceived', value)
    });
  },

  methods: {
    goAuth() {
      this.authForm.renderModal();
    }
  }
}
</script>

<template>
  <div>
    <h1>Hello</h1>
    <button @click="goAuth">Auth me</button>
  </div>
</template>