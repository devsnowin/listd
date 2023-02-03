<script>
	import { AppBar, LightSwitch } from '@skeletonlabs/skeleton';
</script>

<AppBar>
	<svelte:fragment slot="lead">
		<h1><a href="/" class="text-3xl font-bold">ListD</a></h1>
	</svelte:fragment>
	<svelte:fragment slot="trail">
		<LightSwitch />
		<button class="btn variant-filled-primary btn-base"> Sign In </button>
	</svelte:fragment>
</AppBar>
