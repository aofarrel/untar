# untar
 Expand a tarball with WDL. Supports tar, and only tar. Does not support decompression. 

 If `as_zip` is true, the output will be a zip file with type File. Otherwise, output will be Array[File].

 To prevent the user having to deal with downstream nonsense involving optional types, a File and an Array[File] will **always** be created regardless of the value of `as_zip`, but one of them will always be bogus (and it'll be very clear which one is bogus).