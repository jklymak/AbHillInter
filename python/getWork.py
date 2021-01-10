import xarray as xr
import xmitgcm as xm
import os
from dask.diagnostics import ProgressBar
import sys


f0 = 1.4e-4
U0 = 0.1

runname = 'Iso1kmlowU10Amp305f141B059Base'

print(sys.argv)
if len(sys.argv) > 1:
    runnames = sys.argv[1:]

for runname in runnames:
    data_dir = f'../results/{runname}/input'
    out_dir = f'../reduceddata/{runname}/'

    print(f'processing {data_dir}/{runname}')
    print(f'Writing to {out_dir}')
    try:
        os.mkdir('../reduceddata')
    except:
        pass
    try:
        os.mkdir(out_dir)
    except:
        pass

    ds = xm.open_mdsdataset(data_dir, prefix=['final', 'final2d'], endian="<")
    print(ds)
    w = (ds['VVEL'] * ds['hFacS'] * ds['rAs'] * f0 * U0 ).sum(dim=('YG', 'XC'))
    w.attrs['Processing'] = 'made with getWork.py'

    work = xr.Dataset({'work': w})
    work['AreaS'] = ds['rAs'].sum(dim=('YG', 'XC'))

    sl = ds.isel(YC=64, YG=64)
    with ProgressBar():
        work.to_netcdf(f'{out_dir}/work.nc')
    with ProgressBar():
        sl.to_netcdf(f'{out_dir}/yslice.nc')
    dsads
