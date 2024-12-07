# 3-tier Data Organisation

The data in OmicsDM is organised in a 3-tier structure:
> [**Project**](#project)
> > [**Dataset(s)**](#dataset)
> > > [**File(s)**](#file)

## Project
!!! Info "Can only be created by a user in the admin group"
A project is a collection of datasets. It is the highest level of organisation in OmicsDM.
Here an admin user can define the project name, description, the group of users that can 
create datasets in the project, the default sharing settings etc. 
(see [Administrator Guide/Project creation](../../admin-guide/project-creation) for more details).

## Dataset
A dataset is a collection of files. It is the second level of organisation in OmicsDM.

## File
!!! Info "Individual files cannot be shared"
A file is the lowest level of organisation in OmicsDM. 