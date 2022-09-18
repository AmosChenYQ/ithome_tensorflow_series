import tensorflow.compat.v1 as tf
from tensorflow.compat.v1 import gfile
from google.protobuf import text_format

tf.compat.v1.disable_eager_execution()
tf.compat.v1.reset_default_graph()

OUTPUT_PATH = '../events/'

MODEL_PB = '../pb/model.pb'
MODEL_PBTXT = '../pb/model.pbtxt'
FROZEN_PB = '../pb/frozen_model.pb'
FROZEN_PBTXT = '../pb/frozen_model.pbtxt'


def read_pb():
    graph_def = tf.get_default_graph().as_graph_def()
    with gfile.FastGFile(FROZEN_PB, 'rb') as f:
        graph_def.ParseFromString(f.read())
    tf.import_graph_def(graph_def, name='')

    tf.summary.FileWriter(OUTPUT_PATH+"load_frozen_pb", graph=tf.get_default_graph())


def read_pb_txt():
    # this will cause error. "should not have multiple "versions" fields."
    # graph_def = tf.get_default_graph().as_graph_def()
    graph_def = tf.GraphDef()
    with gfile.FastGFile(FROZEN_PBTXT, 'rb') as f:
        text_format.Parse(f.read(), graph_def)
    tf.import_graph_def(graph_def, name='')

    tf.summary.FileWriter(OUTPUT_PATH+"load_frozen_pbtxt", graph=tf.get_default_graph())


if __name__ == '__main__':
    # read_pb()
    read_pb_txt()
