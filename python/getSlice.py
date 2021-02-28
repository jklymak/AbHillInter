import xarray as xr
import xmitgcm as xm
import os
from dask.diagnostics import ProgressBar

runname = 'Iso3kmlowU10Amp305f141B059Patch'
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

with xm.open_mdsdataset(data_dir, prefix=['final'], endian='<', geometry='cartesian') as ds:

    ds = ds.isel(YC=200, YG=200)
    ds = ds.isel(time=slice(0,361, 20))
    print(ds)
    
    with ProgressBar():
        ds.to_netcdf(f'{out_dir}/SliceMid.nc')
