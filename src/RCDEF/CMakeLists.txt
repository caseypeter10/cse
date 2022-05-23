set(source
  ../CVPAK.CPP
  ../DMPAK.CPP
  ../ENVPAK.CPP
  ../LOOKUP.CPP
  ../MESSAGES.CPP
  ../MSGTBL.CPP
  ../RCDEF.CPP
  ../RMKERR.CPP
  ../STRPAK.CPP
  ../TDPAK.CPP
  ../XIOPAK.CPP
)

set(headers
  ../CNGLOB.H
  ../DMPAK.H
  dtypes.h
  ../LOOKUP.H
  ../MESSAGES.H
  ../RMKERR.H
  ../XIOPAK.H
)

include_directories(
  ..
  .
)

add_definitions(-DNOVRR)

add_executable(RCDEF ${source} ${headers})

# Added for debuging purposes to be deleted in the future
target_compile_options(RCDEF PRIVATE
  $<$<CXX_COMPILER_ID:MSVC>:/W4>
  $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>>:
  -Wno-writable-strings -Wno-format -Wno-unused-value>
)

target_compile_features(RCDEF PRIVATE cxx_std_17)
