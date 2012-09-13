module.exports = function(grunt) {

	grunt.loadNpmTasks('grunt-less');

	grunt.initConfig({

		// compila arquivos less
		less: {
			style: {
			  src: 'src/less/style.less',
			  dest: 'src/css/style.css',
			  options: {
			    yuicompress: true
			  }
			},
			ie8: {
			  src: 'src/less/ie8.less',
			  dest: 'src/css/ie8.css',
			  options: {
			    yuicompress: true
			  }
			}
		},

		// watch pra dev
	    watch: {
	      files: 'src/less/**',
	      tasks: 'default'
	    }

	});

	// dev mode: so compila less
	grunt.registerTask('default', 'less');
};