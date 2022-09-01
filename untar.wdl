version 1.0

task untar {
	input {
		File    input
		Int     compression_level = 1
	}
	String basestem_input = basename(input, ".tar")

	command <<<

	cp ~{input} . # TODO: Is this copy strictly necessary?
	tar -xvf ~{basestem_input}.tar
	>>>

	output {
		Array[File] untar = glob("${basestem_input}/*")
	}
}

workflow untar {
	input {
		File input
	}

	call untar {
		input:
			input  = input
	}
}