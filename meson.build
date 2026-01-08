project('editing-traces', meson_version: '>=1.4.0')

sections_gz = {}
sections = {}

subdir('sequential_traces')
subdir('concurrent_traces')

gzip = find_program('gzip')

foreach section_name, traces_gz: sections_gz
  traces = []
  foreach trace_gz : traces_gz
    trace_name = trace_gz.full_path().replace(meson.project_source_root() + '/', '')
    output_name = trace_name.underscorify().replace('_json_gz', '')

    traces += custom_target(
      trace_name.underscorify(),
      input: trace_gz,
      output: output_name + '.json',
      command: [gzip, '-cd', '@INPUT@'],
      capture: true
    )
  endforeach
  sections += { section_name: traces }
endforeach

sequential_traces = []
concurrent_traces = []
sequential_traces = sections['sequential']
concurrent_traces = sections['concurrent']
