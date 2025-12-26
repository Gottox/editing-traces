project('editing-traces')

gz_gen = generator(
  find_program('gzip'),
  output: '@BASENAME@',
  capture: true,
  arguments: [
    'gzip', '-cd', '--', '@INPUT@',
  ]
)

subdir('concurrent_traces')
subdir('sequential_traces')

concurrent_traces = []
sequential_traces = []

foreach trace : concurrent_traces_gz
  concurrent_traces += gz_gen.process(trace)
endforeach
foreach trace : sequential_traces_gz
  sequential_traces += gz_gen.process(trace)
endforeach
