import tensorflow.compat.v1 as tf
import tensorflow as tf_v2
import numpy as np

tf.compat.v1.disable_eager_execution()
tf.compat.v1.reset_default_graph()

OUTPUT_PATH = '../events/'


def main():
    input_node = tf.placeholder(shape=[None, 100, 100, 3], dtype=tf.float32, name='input_node')
    training_node = tf.placeholder(shape=(), dtype=tf.bool, name='training')

    net = tf.layers.conv2d(input_node, 32, (3, 3), strides=(2, 2), padding='same', name='conv_1')
    net = tf.layers.batch_normalization(net, training=training_node, name='bn')

    net = tf.layers.conv2d(net, 32, (3, 3), strides=(1, 1), padding='same', name='conv_2')
    net = tf.layers.dropout(net, rate=0.6, training=training_node, name='dropout')

    net = tf_v2.nn.relu(net, name="relu_1")
    net = tf_v2.nn.relu(net, name="relu_2")
    net = tf_v2.nn.relu(net, name="relu_3")

    input_batch_1 = np.random.rand(1, 100, 100, 3)

    tf.identity(net, name='final')

    optimizer_options = tf.OptimizerOptions(global_jit_level=tf.compat.v1.OptimizerOptions.ON_2)
    graph_options = tf.GraphOptions(optimizer_options=optimizer_options)
    config = tf.ConfigProto(graph_options=graph_options)

    with tf.Session(config=config) as sess:
        sess.run(tf.global_variables_initializer())
        sess.run(tf.local_variables_initializer())

        result = sess.run(net, feed_dict={input_node: input_batch_1, training_node: False})
        result = sess.run(net, feed_dict={input_node: input_batch_1, training_node: False})
        result = sess.run(net, feed_dict={input_node: input_batch_1, training_node: False})
        print(result.shape)
        
        frozen_graph = tf.graph_util.convert_variables_to_constants(
            sess, tf.get_default_graph().as_graph_def(), ['final'])

        tf.summary.FileWriter(OUTPUT_PATH+"relu_bn_dropout_frozen_model", graph=frozen_graph)
        tf.io.write_graph(frozen_graph, "../pb/", "relu_bn_dropout_frozen_model.pb", as_text=False)


if __name__ == '__main__':
    main()
