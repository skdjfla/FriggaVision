# rm -rf /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_train_lmdb
# rm -rf /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_train_lmdb


base_dir=$1
data_dir=$2

echo "gen_lmdb_imgmean$base_dir $data_dir"
rm -rf "$base_dir/train_lmdb"
rm -rf "$base_dir/validation_lmdb"

# mkdir ./webface/train_lmdb
# mkdir ./webface/test_lmdb


caffe_dir="/home/ch3n/caffe"
echo "Creating train lmdb..."
$caffe_dir/build/tools/convert_imageset --resize_height=64 --resize_width=64 --shuffle --backend="lmdb" "$data_dir" "$base_dir/train_list.txt" "$base_dir/train_lmdb" 2>&1 |tee "$base_dir/create_train_lmdb.log" 
# /media/ikode/Document/big_materials/document/deep_learning/caffe/face_datasets/webface/croped/ /home/ikode/caffe-master/examples/deepID/10000/deepID_train_10000.txt /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_train_lmdb 2>&1 |tee /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_create.log

# /home/ikode/caffe-master/build/tools/convert_imageset --resize_height=64 --resize_width=64 --shuffle --backend="lmdb" /media/ikode/Document/big_materials/document/deep_learning/caffe/face_datasets/webface/croped/ /home/ikode/caffe-master/examples/deepID/10000/deepID_train_10000.txt /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_train_lmdb 2>&1 |tee /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_create.log
echo "Creating validation lmdb..."
$caffe_dir/build/tools/convert_imageset --resize_height=64 --resize_width=64 --shuffle --backend="lmdb" "$data_dir" "$base_dir/validation_list.txt" "$base_dir/validation_lmdb" 2>&1 |tee "$base_dir/create_test_lmdb.log"

# /home/ikode/caffe-master/build/tools/convert_imageset --resize_height=64 --resize_width=64 --shuffle --backend="lmdb" /media/ikode/Document/big_materials/document/deep_learning/caffe/face_datasets/webface/croped/ /home/ikode/caffe-master/examples/deepID/10000/deepID_val_10000.txt /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_test_lmdb 2>&1 |tee -a /home/ikode/caffe-master/examples/deepID/10000/deepID_10000_create.log

echo "Compute image mean..."
$caffe_dir/build/tools/compute_image_mean "$base_dir/train_lmdb" "$base_dir/train_mean.binaryproto"

echo "Done"
