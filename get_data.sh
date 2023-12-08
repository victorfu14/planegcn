## prepare data
mkdir dataset && cd dataset

# step1: download Argoverse HD Maps
wget "https://s3.amazonaws.com/argoverse/datasets/av1/tars/hd_maps.tar.gz"
tar xf hd_maps.tar.gz
# copy map to argoverseapi root folder
PY_SITE_PACKAGE_PATH=$(python -c 'import site; print(site.getsitepackages()[0])')
echo "copying map files to python3.7/site-packages: ", $PY_SITE_PACKAGE_PATH
cp -r map_files $PY_SITE_PACKAGE_PATH

# step2: download Argoverse Motion Forecasting **v1.1** 
# train + val + test
wget "https://s3.amazonaws.com/argoverse/datasets/av1/tars/forecasting_train.tar.gz"
wget "https://s3.amazonaws.com/argoverse/datasets/av1/tars/forecasting_val.tar.gz"
wget "https://s3.amazonaws.com/argoverse/datasets/av1/tars/forecasting_test.tar.gz"
tar xvf forecasting_train.tar.gz
tar xvf forecasting_val.tar.gz
tar xvf forecasting_test.tar.gz

# step3: preprocess data to accelerate training

# STEP3-Option1: preprocess data locally, it's very slow, will take a few hours
# python preprocess_data.py -m lanegcn

# STEP3-Option2: Download from my digitalocean space
wget https://yun.sfo2.cdn.digitaloceanspaces.com/public/lanegcn/test_test.p
wget https://yun.sfo2.cdn.digitaloceanspaces.com/public/lanegcn/train_crs_dist6_angle90.p
wget https://yun.sfo2.cdn.digitaloceanspaces.com/public/lanegcn/val_crs_dist6_angle90.p
