import setuptools

setuptools.setup(
	name = 'trimps-collector',
	version = '0.0.1',
	author = 'Mike Cronce',
	author_email = 'mike@quadra-tec.net',
	description = (
		'A poller that loads a Trimps savefile and exports stats from it'
	),
	scripts = [
		'entrypoint',
		'entrypoint.archiver',
		'poll'
	]
)

