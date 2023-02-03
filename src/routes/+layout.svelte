<script>
	// import '@skeletonlabs/skeleton/themes/theme-skeleton.css';
	// import '@skeletonlabs/skeleton/themes/theme-crimson.css';
	import '../theme.postcss';
	import '@skeletonlabs/skeleton/styles/all.css';
	import '../app.postcss';
	import Header from '../components/layout/Header.svelte';
	import { AppShell } from '@skeletonlabs/skeleton';
	import Footer from '../components/layout/Footer.svelte';
</script>

<AppShell>
	<svelte:fragment slot="header">
		<Header />
	</svelte:fragment>
	<slot />
	<svelte:fragment slot="footer">
		<Footer />
	</svelte:fragment>
</AppShell>
