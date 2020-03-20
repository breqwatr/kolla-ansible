# breqwatr/kolla-ansible

This is the BMCA image for Kolla-Ansible.

When pulling this container, you usually don't want the latest.
Instead, be sure to grab the image tagged with your release of OpenStack so it
matches the Kolla images. For instance, for Rocky you'd want to pull
`breqwatr/kolla-ansible:rocky`.


## Environment variables

The Dockerfile uses a build-arg to define the release.

```

RELEASE     (required)    Define the git branch that Kolla-Ansible will be
                          installed from. Supports: rocky,stein,train

```
