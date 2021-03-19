import xarray as xr
import xmitgcm as xm
import os
from dask.diagnostics import ProgressBar
import pdb

runname = 'Iso3kmlowU10Amp305f141B059MixRoughPatch100'
data_dir = f'../results/{runname}/input'
out_dir = f'../reduceddata/{runname}/'
try:
    os.mkdir('../reduceddata')
except:
    pass
try:
    os.mkdir(out_dir)
except:
    pass

if False:
    ds = xm.open_mdsdataset(data_dir, prefix=['spinup'], endian='=',
                        geometry='cartesian')
    print(ds)
    ds = ds.isel(YC=200, YG=200)
    print(ds)
    with ProgressBar():
        #ds.to_netcdf(f'../reduceddata/{runname}/SliceMid.nc', engine='netcdf4')
        ds.to_zarr(f'../reduceddata/{runname}/SliceMid.zar', mode='w')

with xr.open_zarr(f'../reduceddata/{runname}/SliceMid.zar') as ds:
    ds.to_netcdf(f'../reduceddata/{runname}/SliceMid.nc')