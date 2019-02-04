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
      authForm: null,
      redirectUri: 'https://authapp.tst.protocol.one/success/?check=true',
      isRedirectUriUsed: 'true',
    }
  },

  mounted() {

  },

  methods: {
    goAuth() {
      const authForm = new P1AuthWebSdk({
          clientID: '5c221cde5ffa56fdd05257df',
          redirectUri: this.isRedirectUriUsed === 'true' ? this.redirectUri : '',
          // language: 'en',
        })
      authForm.on('tokenReceived', (value) => {
        console.log(11111, 'token', value)
        alert(value);
      });

      authForm.renderModal();
    }
  }
}
</script>

<template>
  <div>
    <h1>Hello</h1>
    <div>
      <h4>Use redirect URI?</h4>
      <label>
        <input type="radio" value="true" v-model="isRedirectUriUsed">
        Yes
      </label>
      <label>
        <input type="radio" value="false" v-model="isRedirectUriUsed">
        No
      </label>
    </div>
    <div>
      <pre>{{isRedirectUriUsed}}</pre>
      <h4>Redirect URI</h4>
      <input type="text" v-model="redirectUri" :disabled="isRedirectUriUsed === 'false'" style="width: 100%">

    </div>
    <br>
    <button @click="goAuth">Auth me</button>
  </div>
</template>