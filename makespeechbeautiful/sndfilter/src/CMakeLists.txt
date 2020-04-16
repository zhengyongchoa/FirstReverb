
# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_LIB_SRCS 变量
aux_source_directory(. DIR_LIB_SRCS)
SET(reLib_SRCS
		biquad.c
		compressor.c
		mem.c
		reverb.c
		snd.c
		wav.c
#	dynamicMemory.c
#	fft.c
#	gt.c
#	ltsv.c
#	contextstream.c
#	pitch.c

)

SET(reLib_HEADERS
		biquad.h
		compressor.h
		mem.h
		reverb.h
		snd.h
		wav.h
#	dynamicMemory.h
#	fft.h
#	gt.h
#	ltsv.h
#	contextstream.h
#	pitch.h
#
#	gt_data_weight.h
#	mstatic_data_weight.h
	
)

# 生成链接库
add_library (NB_zyc ${reLib_SRCS} ${reLib_HEADERS})
