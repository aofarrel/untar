version 1.0

task untar {
	input {
		File    input
		#Boolean as_zip = false
		Int     compression_level = 1
	}
	String basestem_input = basename(input, ".tar")

	command <<<

	cp ~{input} . # TODO: Is this copy strictly necessary?
	tar -xvf ~{basestem_input}.tar
	touch bogus_do_not_use.zip

	#if [[ "~{as_zip}" = "true" ]]
	#then
	#	pigz -~{compression_level} --zip
	#fi
	## ideally, we should want to compress a directory without using tar

	>>>

	output {
		File untar_zip = if(as_zip) then "" else "bogus_do_not_use.zip"
		Array[File] untar = if(!as_zip) then glob("${basestem_input}/*") else ["bogus_do_not_use.zip"]
	}
}

workflow untar {
	input {
		File input
		Boolean as_zip
	}

	call untar {
		input:
			input  = input,
			as_zip = as_zip
	}
}