<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
    

        <q-toolbar-title>
          VHOL Datashare Lab
        </q-toolbar-title>

      
      </q-toolbar>
    </q-header>



    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>




export default {
  name: 'MainLayout',

  data () {
    return {
      leftDrawerOpen: false,
      essentialLinks: linksData
    }
  }
}
</script>
