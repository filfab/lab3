import sys

def get_input(*argument_formats: int|float|str) -> list[int|float|str]:
    """Return a tuple of parsed inputs."""

    argument_count = len(sys.argv) - 1
    inputs = []

    if argument_count == 0:
        for argument_format in argument_formats:
            inputs.append(argument_format(input(f'Input of type {argument_format.__qualname__}: ')))
    elif argument_count == len(argument_formats):
        for i, argumet in enumerate(sys.argv[1:]):
            inputs.append(argument_formats[i](argumet))
    else:
        print(f'incorrect number of agruments given (expected {len(argument_formats)}, got {argument_count})')
        exit(-1)

    return inputs
