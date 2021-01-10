import xarray as xr
import xmitgcm as xm
import os
from dask.diagnostics import ProgressBar

runname = 'Iso1kmlowU10Amp305f141B059Base'
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

ds = xm.open_mdsdataset(data_dir, prefix=['final', 'final2d'])

work = (ds['VVEL'] * ds['hFacS'] * ds['rAs']).sum(dim=('YG', 'XC'))

work.attrs['Processing'] = 'made with getWork.py'

with ProgressBar():
    work.to_netcdf(f'{out_dir}/work.nc')
