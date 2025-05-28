using System;
using UnityEngine;

namespace _Project.Scripts
{
    public class Rotator : MonoBehaviour
    {
        [SerializeField] private float _rotationSpeed = 10f;

        private void Update()
        {
            transform.Rotate(Vector3.up, _rotationSpeed * Time.deltaTime);
        }
    }
}