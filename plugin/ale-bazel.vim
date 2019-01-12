call ale#linter#Define('bzl', {
\   'name': 'bazel-scala',
\   'executable': 'bpb-filtered',
\   'command': 'bpb-filtered %s',
\   'callback': 'ale_handlers#scala#bazel#Handle',
\})

call ale#linter#Define('scala', {
\   'name': 'bazel-scala',
\   'executable': 'bpb-filtered',
\   'command': 'bpb-filtered %s',
\   'callback': 'ale_handlers#scala#bazel#Handle',
\})

call ale#linter#Define('thrift', {
\   'name': 'bazel-scala',
\   'executable': 'bpb-filtered',
\   'command': 'bpb-filtered %s',
\   'callback': 'ale_handlers#scala#bazel#Handle',
\})
