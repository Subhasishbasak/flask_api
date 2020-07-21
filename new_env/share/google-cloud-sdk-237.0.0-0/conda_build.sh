if [ -z ${CONDA_BUILD+x} ]; then
	source /home/conda/feedstock_root/build_artifacts/google-cloud-sdk_1551896079316/work/build_env_setup.sh
fi
#!/bin/bash

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir
mkdir -p $PREFIX/bin

cp -r * $outdir
for FNAME in gcloud gsutil bq
do
    sed -i.bak "s|# <cloud-sdk-sh-preamble>|export CLOUDSDK_PYTHON=$PREFIX/bin/python|g" $outdir/bin/$FNAME
    ln -s $outdir/bin/$FNAME $PREFIX/bin
done
