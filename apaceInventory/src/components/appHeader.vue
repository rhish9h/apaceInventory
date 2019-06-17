<template>
    <div>
        <b-navbar toggleable="lg" type="light" variant="light">
            <b-navbar-brand href="homePage">
              <img src="@/assets/apace_badge_nowhitespace.png" alt="home" style="width: 1.5em; height: 1.5em;">
              {{ brand.name }}
            </b-navbar-brand>

            <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

            <b-collapse id="nav-collapse" is-nav>

            <!-- Right aligned nav items -->
            <b-navbar-nav class="ml-auto">
                <h5>
                  <b-badge v-if="isAdmin" variant="success" style="margin: 0.3em; padding: 0.5em; margin-top: 0.7em">
                    admin
                  </b-badge>
                  &nbsp;
                </h5>
                <b-nav-form>
                <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
                <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
                </b-nav-form>

                <b-nav-item-dropdown right>
                <!-- Using 'button-content' slot -->
                <template slot="button-content">
                  <em>
                    <img src="@/assets/user_icon.png" alt="user" style="width: 1.6em; height: 1.6em; margin-top: 0.3em;">
                  </em>
                </template>
                <b-dropdown-item href="#">Profile</b-dropdown-item>
                <b-dropdown-item href="#">Sign Out</b-dropdown-item>
                </b-nav-item-dropdown>
            </b-navbar-nav>
            </b-collapse>
        </b-navbar>
        </div>
</template>

<script>
export default {
  name: 'appHeader',
  data () {
    return {
      brand: {
        name: 'Apace Inventory'
      },
      isAdmin: true
    }
  }
}
</script>

<style scoped>

</style>
